from typing import Union

from fastapi import FastAPI, Request

app = FastAPI()


@app.get("/")
def read_root(request: Request):
    print(request.headers)
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
