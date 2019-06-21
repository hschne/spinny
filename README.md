<h1 align="center">Spinny</h1> 
<p align="center">Another terminal spinner written in Bash. Customizable and pretty :lipstick:</p>

<p align="center">
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/contains-cat-gifs.svg"></a>
<a href="https://forthebadge.com"><img src="https://forthebadge.com/images/badges/made-with-crayons.svg"></a>
</p>

<br>

## How to use this

Simple. First download spinny

```
wget https://raw.githubusercontent.com/hschne/gatsh/master/spinny.sh
```

To use it in your shell scripts import it, and you are good to go: 

```
source spinny.sh

printf "Starting some long running process now... "
spinny::start
sleep 4
spinny::stop
printf "Done!\n"
```

Spinny supports various customization options. You can use different styles, customize the speed of the animation and more. See [the demo](demo.sh) for more examples!

## Notes 

Spinny has been written so should not impact your existing shell scripts. 

However, be aware that some animations display differently depending on your font. If you encounter issues when using unicode characters please try to set the `SPINNY_CUSTOM_SIZE` variable.

Feel free to file issues if you encounter errors. 

## License

[MIT](LICENSE) (c) [@hschne](https://github.com/hschne)
