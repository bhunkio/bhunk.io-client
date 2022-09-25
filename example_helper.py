from typing import Optional
import urllib
import requests


class Config(dict):
    CHECK_JOB_PATH = "/api/worker/jobs"
    PUSH_RESULT_PATH = "/api/worker/results"

    def HEADERS(KEY):
        return {
            'bhunkio_auth': KEY
        }


def build_url(base_url, path, args_dict={}):
    url_parts = list(urllib.parse.urlparse(base_url))
    url_parts[2] = path
    url_parts[4] = urllib.parse.urlencode(args_dict)
    return urllib.parse.urlunparse(url_parts)


def get_job(url, headers) -> Optional[dict]:
    response = requests.get(
        url,
        headers=headers
    )
    if response and response.json()['uuid'] != None:
        return response.json()
    else:
        print(f"no response {response.text}")
        return None
