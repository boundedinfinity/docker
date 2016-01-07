# Using `dockershell`

## Project layout

```
project directory
|   Dockerfile
|   <project files>
|   ...
|-- docker
  |   dockershell.bash
  |   dockershell.fish
  |   dockershellenv
```

### Docker directory

Copy the `dockershell.bash` and/or `dockershell.fish` script into the `<project directory>/docker` directory.

### dockershellenv

This is the configuration file using to configure the `dockershell` environment.  It has the following options:

- **tag**

    ```
    setenv tag <docker tag>
    ```

    for example:

    ```
    setenv tag "myproject:1.0"
    ```

- **opts**

    ```
    setenv tag <docker options>
    ```

    for example:

    ```
    setenv opts "-p 8080:8080"
    ```

and example `dockershellevn`:

```
setenv tag "myproject:1.0"
setenv opts "-p 8080:8080"
```

**NOTE:** These functions assume the directory structure
