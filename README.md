To run this on any machine with a suitable GPU run.
```
sudo docker run -it --gpus=all --env API_KEY=<API_KEY> --env BHUNKIO_URL=https://www.bhunk.io chitalian/bhunkio-client:0.0.1 bash -c "conda run --no-capture-output -n ldm python bhunkio.py"
```