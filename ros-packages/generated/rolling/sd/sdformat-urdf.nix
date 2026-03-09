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
  urdf,
  urdf-parser-plugin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sdformat_urdf";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."sdformat_urdf";
  propagatedNativeBuildInputs = [ ament-cmake-ros pluginlib rcutils sdformat-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liburdfdom-headers-dev" "tinyxml2" ]; };
  propagatedBuildInputs = [ ament-cmake-ros pluginlib rcutils sdformat-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  passthru.sources = mkSourceSet (sources: {
    "sdformat_urdf" = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "a3e21240176399102fc49ad6514eb74219881b41";
        hash = "sha256-FQnKqaSC0pSYrnsXWGCI0Gym2eDRF5iv6+SKOjfAyVE=";
      };
    };
  });
  meta = {
    description = "\n    URDF plugin to parse SDFormat XML into URDF C++ DOM objects.\n  ";
  };
})
