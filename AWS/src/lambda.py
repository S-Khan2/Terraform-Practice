# Contains lambda handler code
import logging

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

def lambda_handler(event, context):
    # This will return the event that triggered it
    LOGGER.info(f"Triggering Event:\n{event}")
    LOGGER.info("Lambda successfully executed")
    return f"Triggering Event:\n{event}"