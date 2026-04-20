{
  autoware-cmake,
  buildAmentCmakePackage,
  continental-msgs,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-continental-common,
  nebula-core-common,
  nebula-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_continental_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_continental_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ continental-msgs diagnostic-msgs nebula-continental-common nebula-core-common nebula-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ continental-msgs diagnostic-msgs nebula-continental-common nebula-core-common nebula-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_continental_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_continental_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "587694f59ca5b84550a3c059cb932f4455ec88ff";
        hash = "sha256-C4S4DGtMvGs5jFkBFN6ugS48XD2pt8i8SMF8sqkSJBY=";
      };
    };
  });
  meta = {
    description = "Nebula Continental Decoders Library";
  };
})
