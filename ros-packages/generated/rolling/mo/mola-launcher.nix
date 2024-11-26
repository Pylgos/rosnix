{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_launcher";
  nativeBuildInputs = [ ament-cmake ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ mola-kernel mrpt-libbase mrpt-libtclap ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_launcher" = substituteSource {
        src = fetchgit {
          name = "mola_launcher-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "b4b9a4567d7dd2c425ba10cf93fe23283183ea92";
          hash = "sha256-9gBFK1XAsAwG0ptzkpINnG88WBZjQ6oV0mA06sofV5c=";
        };
      };
    });
  };
  meta = {
    description = "Launcher app for MOLA systems";
  };
})
