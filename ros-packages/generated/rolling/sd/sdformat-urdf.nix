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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."sdformat_urdf";
  propagatedNativeBuildInputs = [ ament-cmake-ros pluginlib rcutils sdformat-vendor tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liburdfdom-headers-dev" ]; };
  propagatedBuildInputs = [ ament-cmake-ros pluginlib rcutils sdformat-vendor tinyxml2-vendor urdf urdf-parser-plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  passthru.sources = mkSourceSet (sources: {
    "sdformat_urdf" = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "7b523826d820c505240abb4be5fe1882f2b36aba";
        hash = "sha256-zssvuO4OlSq92/NjZ6belnDp1ef0HVoJ4pz9gofivMI=";
      };
    };
  });
  meta = {
    description = "\n    URDF plugin to parse SDFormat XML into URDF C++ DOM objects.\n  ";
  };
})
