dimensions=(1080 360 32)
mkdir -p "${dimensions[@]}"

for folder in "${dimensions[@]}"
do
	echo "${folder}"

	for f in *.{png,PNG,jpg,JPG}
		do magick convert $f -set filename:name %t -resize ${folder} -quality 80 ${folder}/%[filename:name].jpg
	done
done

mkdir -p "fullsize"

for f in *.{png,PNG,jpg,JPG}
do magick convert $f -set filename:name %t fullsize/%[filename:name].jpg
done
rm *.{png,PNG,jpg,JPG}
