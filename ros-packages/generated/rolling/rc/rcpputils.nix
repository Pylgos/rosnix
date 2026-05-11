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
  version = "2.15.0-1";
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
        rev = "13da3d155b176386dfb4bdfa14c741d9bd381628";
        hash = "sha256-SInLJ9XeMtDi0lqts024bF/TO/sILcrZsSvNborr+ps=";
      };
    };
  });
  meta = {
    description = "Package containing utility code for C++.";
  };
})
