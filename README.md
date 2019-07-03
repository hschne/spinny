<h1 align="center">Spinny</h1> 
<p align="center">Yet another terminal spinner written in Bash. Customizable and pretty :lipstick:</p>

<p align="center">
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/contains-cat-gifs.svg"></a>
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/made-with-crayons.svg"></a>
</p>

<div align="center"><img src="demo.gif"/></div>

<br>

## How do I use this?

Simple. First download spinny:

```
wget https://raw.githubusercontent.com/hschne/spinny/master/spinny.sh
```

To use it in your shell scripts import it, and you are good to go: 

```
source spinny.sh

printf "Starting some long running process now... "
spinny::start
sleep 3
spinny::stop
printf "Done!\n"
```

Spinny is versatile and can animate pretty much anything you throw at it. The variables `SPINNY_FRAMES` and `SPINNY_DELAY` can be used to change the look of the spinner. The code below will render three dots instead: 

```
SPINNY_FRAMES=(. .. ...)
SPINNY_DELAY=0.1
printf "Fancy spinners right here: "
spinny::start
sleep 3
spinny::stop
printf " \n"
```

Have a look at [the demo](demo.sh) for more examples or run it yourself: 

```
chmod +x demo.sh && ./demo.sh
```

## Contributing

I'm new to this entire bash thing. While I try and keep things portable and dependencies to a minimum, I can't guarantee that Spinny will work on your particular machine.

If you encounter any errors or have ideas for improvements feel free to file an issue! :heart:

## License

[MIT](LICENSE) (c) [@hschne](https://github.com/hschne)
