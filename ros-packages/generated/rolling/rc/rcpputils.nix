{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-ros-core,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcpputils";
  version = "2.14.4-1";
  src = finalAttrs.passthru.sources."rcpputils";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rcpputils" = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "9fb59cda6c0dbf599ad66b696c465f6d9f4e910d";
        hash = "sha256-e49uEAYzjThOBItQ6QizmclzA3GOZoALttrbY03jvyw=";
      };
    };
  });
  meta = {
    description = "Package containing utility code for C++.";
  };
})
