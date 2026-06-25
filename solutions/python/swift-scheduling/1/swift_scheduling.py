from datetime import datetime, timedelta


def delivery_date(start, description):
    if isinstance(start, str):
        start = datetime.fromisoformat(start)

    if description == "NOW":
        return (start + timedelta(hours=2)).isoformat()

    if description == "ASAP":
        if start.hour < 13:
            return start.replace(hour=17, minute=0, second=0, microsecond=0).isoformat()
        else:
            tomorrow = start + timedelta(days=1)
            return tomorrow.replace(hour=13, minute=0, second=0, microsecond=0).isoformat()

    if description == "EOW":
        weekday = start.weekday()
        if weekday <= 2:
            days_until_friday = 4 - weekday
            return (start + timedelta(days=days_until_friday)).replace(hour=17, minute=0, second=0, microsecond=0).isoformat()
        else:
            days_until_sunday = 6 - weekday
            return (start + timedelta(days=days_until_sunday)).replace(hour=20, minute=0, second=0, microsecond=0).isoformat()

    if description.endswith("M") and description[:-1].isdigit():
        n = int(description[:-1])
        year = start.year if start.month < n else start.year + 1
        return _first_workday(year, n).isoformat()

    if description.startswith("Q") and description[1:].isdigit():
        n = int(description[1:])
        quarter_end_month = n * 3
        current_quarter = (start.month - 1) // 3 + 1
        year = start.year if current_quarter <= n else start.year + 1
        return _last_workday(year, quarter_end_month).isoformat()


def _first_workday(year, month):
    date = datetime(year, month, 1, 8, 0)
    while date.weekday() > 4:
        date += timedelta(days=1)
    return date


def _last_workday(year, month):
    if month == 12:
        next_month = datetime(year + 1, 1, 1)
    else:
        next_month = datetime(year, month + 1, 1)
    date = next_month - timedelta(days=1)
    date = date.replace(hour=8, minute=0, second=0, microsecond=0)
    while date.weekday() > 4:
        date -= timedelta(days=1)
    return date