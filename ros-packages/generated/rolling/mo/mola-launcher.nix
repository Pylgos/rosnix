{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libbase,
  mrpt-libtclap,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_launcher";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."mola_launcher";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ros-environment ];
  checkInputs = [ ament-cmake-pep257 ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "mola_launcher" = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "c0467b63a4b1443b165b3e698950e627783628e7";
        hash = "sha256-A7SbQoKhNnfCjfZSsnMywRg+jBbVl0OrGNf0JxkG1Wg=";
      };
    };
  });
  meta = {
    description = "Launcher app for MOLA systems";
  };
})
