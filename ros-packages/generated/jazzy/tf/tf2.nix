{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2";
  version = "0.36.10-1";
  src = finalAttrs.passthru.sources."tf2";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rcutils rosidl-runtime-cpp ];
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rcutils rosidl-runtime-cpp ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-google-benchmark ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "tf2" = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "5d82ff3ef8e8bf4bec7e629c68dd71a3c62b4e11";
        hash = "sha256-LG2KUjgfLttR23pBxH4xQGliDDYftjcsUllH3Sqdok4=";
      };
    };
  });
  meta = {
    description = "\n    tf2 is the second generation of the transform library, which lets\n    the user keep track of multiple coordinate frames over time. tf2\n    maintains the relationship between coordinate frames in a tree\n    structure buffered in time, and lets the user transform points,\n    vectors, etc between any two coordinate frames at any desired\n    point in time.\n  ";
  };
})
