{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_interfaces";
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_interfaces" = substituteSource {
        src = fetchgit {
          name = "canopen_interfaces-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "babcc793df4cd98b33de0306400c9324ca1b759d";
          hash = "sha256-40PHfYMqk3Vf1R9VBdJWyTB4pXYbDxHqyNb6PQbe+BY=";
        };
      };
    });
  };
  meta = {
    description = "Services and Messages for ros2_canopen stack";
  };
})
