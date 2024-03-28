# Stack Examples for Load Testing

This repository has some examples of load tests focused on the locust and jmeter tools, being a complement to the learn 
experience presentation.

## How To Use

To execute the instructions below, you need a unix environment and have the Makefile, python and the venv library to 
configure the virtual environment.

```shell
(.xvenv) adrianolaselva@DESKTOP-OU8K4PD:/mnt/d/dados/workspaces/stress-tests/locust$ make
➜ help                           Help     List All Commands❓
➜ locust-configure               Stack    Configure Stack 🐋
➜ locust-version                 Infra    Infrastructure DOWN 🐋
➜ locust-run                     Locust   Locust Run Without specify Script 🐋
➜ locust-run-script              Locust   Locust is run by specifying script 🐋
```
> Example output make command

### Locust Examples

```shell
make locust-configure
```
> Configure Locust stack

```shell
make locust-run
```
> Example command to start locust application without specify script, by default locust expects a "locustfile.py" file from the execution directory.

```shell
make locust-run-script ./src/scenary_test_one.py
```
> Example command to start locust by specifying a test script.

```shell
locust --headless -u 1 -t 2s --processes 1 -f ./src/scenary_test_one.py
```
> Example of locust execution informing some of the possible additional parameters, including users, execution time and number of processes.

When running locust, by default it will be available at the address "localhost:8089" if it is not run only for the command line

![img.png](docs%2Fimages%2Fimg.png)
> Locust page when running it as default

![img_1.png](docs%2Fimages%2Fimg_1.png)
> Example of terminal output when running locust via command line only

### JMeter Examples

```shell
make jmeter-configure
```
> Configure jMeter stack

```shell
make jmeter-run
```
> Example command to start jMeter application without specify script.

```shell
make jmeter-run-script ./jmeter-scripts/http-request-example-one.jmx
```
> Example command to start jMeter application without specify script.

```shell
./jmeter/bin/jmeter -Jthreads=1 -n -t ./src/scenary_test_one.py
```
> Example of jMeter execution informing some of the possible additional parameters, including number of threads.

When running jMeter, by default a desktop application will open where it is possible to configure test settings, and it 
will also be possible to save it to run via the command line, for example in a pipeline.

![img_2.png](docs%2Fimages%2Fimg_2.png)
> JMeter page when running it as default

## References

- [jmeter](https://jmeter.apache.org/usermanual/get-started.html)
- [locust](https://locust.io/)
