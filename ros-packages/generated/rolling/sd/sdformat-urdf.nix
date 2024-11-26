{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  sdformat-test-files,
  sdformat-vendor,
  substituteSource,
  tinyxml2-vendor,
  urdf,
  urdf-parser-plugin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_urdf";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."sdformat_urdf";
  propagatedNativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils sdformat-vendor tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sdformat_urdf" = substituteSource {
        src = fetchgit {
          name = "sdformat_urdf-source";
          url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
          rev = "a7a80ef621442c6ebff6bd182d225e8815a97469";
          hash = "sha256-n5Nrn5TAPvuzJhNsos1w943T3HDWOoaoUuJbyyg1T18=";
        };
      };
    });
  };
  meta = {
    description = "URDF plugin to parse SDFormat XML into URDF C++ DOM objects.";
  };
})
