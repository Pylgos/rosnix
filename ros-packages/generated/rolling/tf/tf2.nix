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
  version = "0.43.0-1";
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
        rev = "add4972273d569d0f08dfbbffd463c623d40f07f";
        hash = "sha256-LkP0EK/pZrS9KncuZGxLZD35r18zsbi7CLrCA9pJzms=";
      };
    };
  });
  meta = {
    description = "\n    tf2 is the second generation of the transform library, which lets\n    the user keep track of multiple coordinate frames over time. tf2\n    maintains the relationship between coordinate frames in a tree\n    structure buffered in time, and lets the user transform points,\n    vectors, etc between any two coordinate frames at any desired\n    point in time.\n  ";
  };
})
