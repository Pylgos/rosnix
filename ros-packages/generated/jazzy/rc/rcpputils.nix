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
  version = "2.11.0-2";
  src = finalAttrs.passthru.sources."rcpputils";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ rcutils ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcpputils" = substituteSource {
        src = fetchgit {
          name = "rcpputils-source";
          url = "https://github.com/ros2-gbp/rcpputils-release.git";
          rev = "114da6d318c5254ae3ddad8eb29006411796ca8b";
          hash = "sha256-A4fgkUrENQpRAgy7AiiW8WK1huoOIvTvoYr4bKTwQK0=";
        };
      };
    });
  };
  meta = {
    description = "Package containing utility code for C++.";
  };
})
