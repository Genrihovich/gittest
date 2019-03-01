// -----------------------------------------------------------------------------
// JPEG2PDF,JPEGtoPDF,JPG2PDF,JPGToPDF
//
// (C) 2003 PAPY
// http://homepage1.nifty.com/MADIA/
//
//  2018 Slaventy
//  JPGtoPDF(JPGFileName,PDFSaveName);
//
// -----------------------------------------------------------------------------

unit jpeg2pdf;

interface

uses
  Windows, Classes, Graphics, SysUtils;

function JPGtoPDF(FileName, SaveName: String): Boolean;

implementation

procedure Write_StringToFile(AStream: TStream; Str: String);
var
  Temp: AnsiString;
begin
  Temp := Str;
  AStream.WriteBuffer(Temp[1], (Length(Temp) * SizeOf(Temp[1])));
end;

procedure Write_CrossReferenceTable(AStream: TStream; PosArray: array of Dword;
  Count: Integer);
Var
  i: Integer;
begin
  With AStream do
  begin
    Write_StringToFile(AStream, 'xref'#10);
    Write_StringToFile(AStream, Format('0 %d'#10, [Count + 1]));
    Write_StringToFile(AStream, '0000000000 65535 f '#10);
    for i := 0 to Count - 1 do
    begin
      Write_StringToFile(AStream, Format('%0.10d', [PosArray[i]]) +
        ' 00000 n '#10);
    end;
  end;
end;

procedure Write_ContentsObject(AStream: TStream; Index: Dword;
  Width, Height: Integer);
Var
  MemoryStream: TMemoryStream;
begin
  MemoryStream := TMemoryStream.Create;
  Try
    // Stream
    With MemoryStream do
    begin
      Write_StringToFile(MemoryStream, 'q'#10);
      Write_StringToFile(MemoryStream, Format('%d 0 0 %d 0 0 cm'#10,
        [Width, Height]));
      Write_StringToFile(MemoryStream, '/Im0 Do'#10);
      Write_StringToFile(MemoryStream, 'Q'#10);
    end;

    MemoryStream.Position := 0;

    // Object
    With AStream do
    begin
      Write_StringToFile(AStream, Format('%d 0 obj'#10, [Index]));
      Write_StringToFile(AStream, Format('<< /Length %d >>'#10,
        [MemoryStream.Size]));
      Write_StringToFile(AStream, 'stream'#10);
      AStream.CopyFrom(MemoryStream, MemoryStream.Size);
      Write_StringToFile(AStream, 'endstream'#10);
      Write_StringToFile(AStream, 'endobj'#10);
    end;
  finally
    MemoryStream.Free;
  end;
end;

function SwapEndian(S: word): word;
begin
  Result := (S and $00FF) shl 8 + (S and $FF00) shr 8;
end;

function GetJPEGSize(FileName: String; var AWidth, AHeight: Integer;
  var CMYK: Boolean): Boolean;
var
  wrk: word;
  Sampling: Byte;
  AStream: TStream;
const
  SOF0: word = $FFC0; // Normal
  SOF2: word = $FFC2; // Progressive
begin
  Result := False;
  AStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    // JFIF
    AStream.ReadBuffer(wrk, 2);
    wrk := SwapEndian(wrk);
    if wrk <> $FFD8 then
      Exit;

    While True do
    begin
      AStream.ReadBuffer(wrk, 2);
      wrk := SwapEndian(wrk);

      // JPEG Maker
      if (wrk = SOF0) or (wrk = SOF2) then
      begin
        // Skip Segment Length
        AStream.Position := AStream.Position + 2;
        // Skip Sample
        AStream.Position := AStream.Position + 1;
        // Height
        AStream.ReadBuffer(wrk, 2);
        AHeight := SwapEndian(wrk);
        // Width
        AStream.ReadBuffer(wrk, 2);
        AWidth := SwapEndian(wrk);

        // ColorMode
        AStream.ReadBuffer(Sampling, 1);
        case Sampling of
          3:
            CMYK := False; // RGB
          4:
            CMYK := True // CMYK
        else
          Break; // ???
        end;

        Result := True;
        Break;
      end
      else if (wrk = $FFFF) or (wrk = $FFD9) then
      begin
        Break;
      end;

      // Skip Segment
      AStream.ReadBuffer(wrk, 2);
      wrk := SwapEndian(wrk);
      AStream.Position := AStream.Position + (wrk - 2);
    end;

  finally
    AStream.Free;
  end;
end;

function JPGtoPDF(FileName, SaveName: String): Boolean;
Var
  Str: String;
  CMYK: Boolean;
  AStream, JPGStream: TStream;
  ObjectIndex, W, H: Integer;
  ObjectPosArray: array [0 .. 10] of Dword;
begin
  result:= false;
  if FileName = '' then
    raise Exception.Create('FileName is nil');

  if SaveName = '' then
    raise Exception.Create('SaveName is nil');

  if not GetJPEGSize(FileName, W, H, CMYK) then
    Exit;

  ObjectIndex := 0;

  AStream := TFileStream.Create(SaveName, fmCreate);
  JPGStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  Try
    // PDF version
    Write_StringToFile(AStream, '%PDF-1.2' + sLineBreak);

    // Catalog
    ObjectPosArray[ObjectIndex] := AStream.Position;
    With AStream do
    begin
      Write_StringToFile(AStream, Format('%d 0 obj'#10, [ObjectIndex + 1]));
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, '/Type /Catalog'#10);
      Write_StringToFile(AStream, '/Pages 2 0 R'#10);
      Write_StringToFile(AStream,
        '/OpenAction [3 0 R /XYZ -32768 -32768 1 ]'#10); // View Option (100%)
      Write_StringToFile(AStream, '>>'#10);
      Write_StringToFile(AStream, 'endobj'#10);
    end;
    Inc(ObjectIndex);

    // Parent Pages
    ObjectPosArray[ObjectIndex] := AStream.Position;

    With AStream do
    begin
      Write_StringToFile(AStream, Format('%d 0 obj'#10, [ObjectIndex + 1]));
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, '/Type /Pages'#10);
      Write_StringToFile(AStream, '/Kids [ 3 0 R ]'#10);
      Write_StringToFile(AStream, '/Count 1'#10);
      Write_StringToFile(AStream, '>>'#10);
      Write_StringToFile(AStream, 'endobj'#10);
    end;
    Inc(ObjectIndex);

    // Kids Page
    ObjectPosArray[ObjectIndex] := AStream.Position;
    With AStream do
    begin
      Write_StringToFile(AStream, Format('%d 0 obj'#10, [ObjectIndex + 1]));
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, '/Type /Page'#10);
      Write_StringToFile(AStream, '/Parent 2 0 R'#10);
      Write_StringToFile(AStream, '/Resources'#10);
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, '/XObject << /Im0 4 0 R >>'#10);
      Write_StringToFile(AStream, '/ProcSet [ /PDF /ImageC ]'#10);
      Write_StringToFile(AStream, '>>'#10);
      Write_StringToFile(AStream, Format('/MediaBox [ 0 0 %d %d ]'#10, [W, H]));
      Write_StringToFile(AStream, '/Contents 5 0 R'#10);
      Write_StringToFile(AStream, '>>'#10);
      Write_StringToFile(AStream, 'endobj'#10);
    end;
    Inc(ObjectIndex);

    // XObject Resource
    ObjectPosArray[ObjectIndex] := AStream.Position;
    With AStream do
    begin
      Write_StringToFile(AStream, Format('%d 0 obj'#10, [ObjectIndex + 1]));
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, '/Type /XObject'#10);
      Write_StringToFile(AStream, '/Subtype /Image'#10);
      Write_StringToFile(AStream, '/Name /Im0'#10);
      Write_StringToFile(AStream, Format('/Width %d'#10, [W]));
      Write_StringToFile(AStream, Format('/Height %d'#10, [H]));
      Write_StringToFile(AStream, '/BitsPerComponent 8'#10);
      Write_StringToFile(AStream, '/Filter [/DCTDecode]'#10);
      if not CMYK then
        Write_StringToFile(AStream, '/ColorSpace /DeviceRGB'#10)
      else
      begin
        Write_StringToFile(AStream, '/ColorSpace /DeviceCMYK'#10);
        Write_StringToFile(AStream, '/Decode[1 0 1 0 1 0 1 0]'#10);
        // Photoshop CMYK (NOT BIT)
      end;
      Write_StringToFile(AStream, Format('/Length %d >>'#10, [JPGStream.Size]));
      Write_StringToFile(AStream, 'stream'#10);
      AStream.CopyFrom(JPGStream, JPGStream.Size);
      Write_StringToFile(AStream, 'endstream'#10);
      Write_StringToFile(AStream, 'endobj'#10);
    end;
    Inc(ObjectIndex);

    // Contents Stream & Object
    ObjectPosArray[ObjectIndex] := AStream.Position;
    With AStream do
    begin
      Write_ContentsObject(AStream, ObjectIndex + 1, W, H);
    end;
    Inc(ObjectIndex);

    // CrossReferenceTable
    ObjectPosArray[ObjectIndex] := AStream.Position;
    Write_CrossReferenceTable(AStream, ObjectPosArray, ObjectIndex);

    // trailer
    With AStream do
    begin
      Write_StringToFile(AStream, 'trailer'#10);
      Write_StringToFile(AStream, '<<'#10);
      Write_StringToFile(AStream, Format('/Size %d'#10, [ObjectIndex + 1]));
      Write_StringToFile(AStream, '/Root 1 0 R'#10);
      Write_StringToFile(AStream, '>>'#10);
      Write_StringToFile(AStream, 'startxref'#10);
      Write_StringToFile(AStream,
        Format('%d'#10, [ObjectPosArray[ObjectIndex]]));
      Write_StringToFile(AStream, '%%EOF');
    end;

  finally
    AStream.Free;
    JPGStream.Free;
   result := true;
  end;

end;

end.
