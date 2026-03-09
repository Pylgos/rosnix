{
  ament-cmake,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "ewellix_interfaces";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."ewellix_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_interfaces" = substituteSource {
      src = fetchgit {
        name = "ewellix_interfaces-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "749cebf9057f2aad9496cec7d20f908e90a1de49";
        hash = "sha256-RNcXEaeF3FUbrZ6XpArCXVGRSacBDYZs42VpwmmvaIU=";
      };
    };
  });
  meta = {
    description = "Ewellix lift ROS 2 driver";
  };
})
