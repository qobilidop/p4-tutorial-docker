# p4-tutorial-docker
A Docker image for doing the [P4 Tutorial](https://github.com/p4lang/tutorials).

## Usage

Build the image:
```bash
make build
```

Run the container:
```bash
make run
```

Join the running container in a new terminal:
```bash
make join
```

In the container shell, we could do the following to check that it works:
```bash
cd exercises/basic
cp solution/basic.p4 .
make run
mininet> h1 ping h2
mininet> pingall
mininet> exit
make stop
make clean
```

## TODO

- When starting mininet with `make run`, I would get this error: `*** Error setting resource limits. Mininet's performance may be affected.`. Need to figure out why.
- Try more exercises. Currently I have only tried the basic exercise.
