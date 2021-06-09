from googleapiclient.discovery import build
from google.oauth2 import service_account

SCOPES = ['https://www.googleapis.com/auth/spreadsheets']
SERVICE_ACCOUNT_FILE = 'keys.json'

creds = None
creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)

# The ID and range of a sample spreadsheet.
SAMPLE_SPREADSHEET_ID = '1bNSfi_e7Q9Ii7M6RUnulx9ta0hvv4oNBqgXTeHO_NSI'
# SAMPLE_RANGE_NAME = 'Class Data!A2:E'

service = build('sheets', 'v4', credentials=creds)

# Call the Sheets API
sheet = service.spreadsheets()
result = sheet.values().get(spreadsheetId=SAMPLE_SPREADSHEET_ID,
                            range="automated!B2:L31").execute()
values = result.get('values', [])

aoa = [["this_is",2000],["an_automated",4000],["update_test",6000],["into_gsheet",10000]]

request = sheet.values().update(spreadsheetId=SAMPLE_SPREADSHEET_ID,
                            range="writing_automated!B2", valueInputOption="USER_ENTERED", body={"values":aoa}).execute()

print(values)
# if not values:
#     print('No data found.')
# else:
#     print('Name, Major:')
#     for row in values:
#         # Print columns A and E, which correspond to indices 0 and 4.
#         print('%s, %s' % (row[0], row[4]))
