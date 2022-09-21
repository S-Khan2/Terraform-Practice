# Contains lambda handler code

def lambda_handler(event, context):
    # This will return the event that triggered it
    return f"Triggering Event:\n{event}"