import json
from typing import Union

from fastapi import FastAPI, Request
from starlette.datastructures import Headers

app = FastAPI()


def sorted_headers(headers: Headers) -> dict:
    items = headers.items()
    # Sort based on the first item (which is the key)
    items.sort(key=lambda x: x[0])
    # Convert the format to make it look better in jq
    items = [x[0] + " = " + x[1] for x in items]

    return json.dumps({"headers": items})


@app.get("/")
def read_root(request: Request):
    # Log headers
    print(sorted_headers(request.headers))

    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
