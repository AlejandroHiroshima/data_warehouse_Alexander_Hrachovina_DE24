import dlt
import pandas as pd
from pathlib import Path
import os


@dlt.resource(write_disposition="replace")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")


if __name__ == "__main__":
    working_directory = Path(__file__).parent

    os.chdir(working_directory)
    csv_path = working_directory / "data" / "NetflixOriginals.csv"
    data = list(load_csv_resource(csv_path, encoding="latin1"))
    print(data)

    pipeline = dlt.pipeline(
        pipeline_name='movies',
        destination="snowflake",
        dataset_name='staging'
        )
    
    # load_info = pipeline.run(data, table_name="netflix")

    # print(load_info)