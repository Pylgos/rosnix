{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
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
  version = "2.14.2-1";
  src = finalAttrs.passthru.sources."rcpputils";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros-core ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rcpputils" = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "bed010d34490c4e7496dbd3a93f9d0d579c4458f";
        hash = "sha256-5ewgyeJffbcxx7W2jO0tjb/DuiWQ/UKdE7Oew7g7nFY=";
      };
    };
  });
  meta = {
    description = "Package containing utility code for C++.";
  };
})
