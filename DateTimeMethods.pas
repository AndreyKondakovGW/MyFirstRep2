unit DateTimeMethods;

function IsLeapYear(year: integer): boolean := ((year mod 4 = 0) and not (year mod 100 = 0)) or (year mod 400 = 0);

function DaysInMonth(month, year: integer): integer;
begin
  if (IsLeapYear(year)) then
    case month of
      1, 3, 5, 7, 8, 10, 12: Result := 31;
      4, 6, 9, 11: Result := 30;
      2: Result := 29;
    end
  else
    case month of
      1, 3, 5, 7, 8, 10, 12: Result := 31;
      4, 6, 9, 11: Result := 30;
      2: Result := 29;
    end;
end;

function LaterInDay(p1, p2: DateTime): DateTime;
begin
  if p1.Hour > p2.Hour then
    Result := p1;
  if p1.Hour < p2.Hour then
    Result := p2;
  if p1.Hour = p2.Hour then
  begin
    if p1.Minute > p2.Minute then
      Result := p1;
    if p1.Minute < p2.Minute then
      Result := p2;
    if p1.Minute = p2.Minute then
    begin
      if p1.Second > p2.Second then
        Result := p1;
      if p1.Second <= p2.Second then
        Result := p2;
    end;
  end;
end;

function LaterInYear(p1, p2: DateTime): Datetime;
begin
  if (max(p1.DayOfYear, p2.DayOfYear) = p1.DayOfYear) then
    result := p1;
  if (max(p1.DayOfYear, p2.DayOfYear) = p2.DayOfYear) then
    result := p2;
end;

function DaysInYear(year: integer): integer := IsLeapYear(year) ? 366 : 365;

function DaysInYearRange(year1, year2: integer): integer := 0;

function SecondsInHours(hours: integer): integer := 0;

begin

end. 