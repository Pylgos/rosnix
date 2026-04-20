{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-decoders,
  nebula-hesai-common,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_hesai_decoders";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_hesai_decoders";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-decoders nebula-hesai-common rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-decoders nebula-hesai-common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_hesai_decoders" = substituteSource {
      src = fetchgit {
        name = "nebula_hesai_decoders-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "20f2dbd1bd60d2278fba52ef942388ba13e38b19";
        hash = "sha256-iPQrRc+VIWppJ49gBh800a8lvv0RwjJOPetJAIHZpEM=";
      };
    };
  });
  meta = {
    description = "Nebula Hesai Decoders Library";
  };
})
