# pony-libzip

Pony implementation of libzip

## Status

pony-libzip is "in-flight" software.  It's getting there.

## Installation

Using corral, into your deps it goes...

```json
{
  "locator": "github.com/redvers/pony-libzip.git",
  "version": ""
}
```

* `corral fetch` to fetch your dependencies
* `use "ponyzip"` to include this package
* `corral run -- ponyc` to compile your application

## Example Use:

### How to Open an arcive

```pony
/* You need to select which flags to open your file with...
   if we assume you just want to read a file, this is a
   reasonable default                                       */

let readflags: ZipFlags = ZipFlags.>set(ZipRDOnly).>set(ZipCheckcons)

/* Now we need to open the archive itself.                  */
let archive: PonyZip = PonyZip("test.zip", readflags)

/* We need to ensure that the file was opened correctly     */
if (not archive.valid()) then
  env.out.print("We have failed to open said file: " + archive.errorstr)
  error
else
  end.out.print("The zip file has been successfully opened  */
end
```

### Analyzing the contents of the archive

```pony
/* There are two basic ways to address files in an archive,
   by name and by index. In this example we are going to
   use the index.                                           */

let count: USize = archive.count()

/* Now let's display each of the filenames in the archive   */

for index in Range(0, count) do
  /* The Zipstat is a struct that contains the basic info
     for file inside the archive.                           */
  let zipstat: Zipstat = archive.zip_stat_index(index)?
  env.out.print("The filename at index: " + index.string() + " is: " + zipstat.name())
end
```

### Reading the contents of a file

```pony
/* You can extract the contents of a file like so:          */
let zipstat0: Zipstat = archive.zip_stat_index(index)?
let data: Array[U8] val = archive.readfile(zipstat0)
```

### Closing the archive

```pony
archive.close()
```

### More examples? Something missing?

Look at the ponyzip/\_test.pony for more examples of usage.
The test suite will likely be the most authoratitive info
available.


### Got Questions? Issues? Requests? Contributions?

Please feel free to open Issues and Pull Requests as needed.



Red

