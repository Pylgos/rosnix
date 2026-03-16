{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_demos";
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."mola_demos";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ros-environment ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "mola_demos" = substituteSource {
      src = fetchgit {
        name = "mola_demos-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "24bfb215fe2a0ee814419177e4cd6c50718c31a2";
        hash = "sha256-TPlNwDHnLK+BMVK90hnrkSUKz2iaj25gdUjhzM+Rbq8=";
      };
    };
  });
  meta = {
    description = "Demo and example launch files for MOLA";
  };
})
