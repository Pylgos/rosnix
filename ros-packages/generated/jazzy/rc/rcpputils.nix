{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
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
  version = "2.11.3-1";
  src = finalAttrs.passthru.sources."rcpputils";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcutils ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "rcpputils" = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "db69d52c2c00156eab58dd2a84e735127a127253";
        hash = "sha256-gWvBOvxgGXwwrVvNP54f5J+TxJeiDFfxGwHUepgj7O4=";
      };
    };
  });
  meta = {
    description = "Package containing utility code for C++.";
  };
})
