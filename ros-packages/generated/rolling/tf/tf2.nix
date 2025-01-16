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
  version = "0.40.1-1";
  src = finalAttrs.passthru.sources."tf2";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rcutils rosidl-runtime-cpp ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-google-benchmark ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "tf2" = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "bcfa35f328c7842775f3bb2dc2f954295de18725";
        hash = "sha256-jRrL3ZkNg1UQs8ZegJSzWfzGklcMvA6FdhJdz8D5Pbc=";
      };
    };
  });
  meta = {
    description = "tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time. tf2 maintains the relationship between coordinate frames in a tree structure buffered in time, and lets the user transform points, vectors, etc between any two coordinate frames at any desired point in time.";
  };
})
