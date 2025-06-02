{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-msgs,
  nav2-simple-commander,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf-transformations,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rai_interfaces";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rai_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs nav2-msgs nav2-simple-commander rosidl-default-runtime sensor-msgs std-msgs tf-transformations vision-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "portaudio19-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs nav2-msgs nav2-simple-commander rosidl-default-runtime sensor-msgs std-msgs tf-transformations vision-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "portaudio19-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rai_interfaces" = substituteSource {
      src = fetchgit {
        name = "rai_interfaces-source";
        url = "https://github.com/ros2-gbp/rai_interfaces-release.git";
        rev = "e3b2787603358c552382abdb390fafeba7b86146";
        hash = "sha256-BFoIVYmP5NdjkhaoiFhLp5lACCEM4/nBLXvt8hh7yPk=";
      };
    };
  });
  meta = {
    description = "Interfaces for RAI communication";
  };
})
