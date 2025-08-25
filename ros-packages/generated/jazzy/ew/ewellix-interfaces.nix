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
  version = "0.2.0-1";
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
        rev = "50f9f710ca0d46de04e1cc33d98f94f0d431f867";
        hash = "sha256-yEOSfhkSGMwxxDvQXrPEXKX/3O1EkPDRojj3Dd8PmlQ=";
      };
    };
  });
  meta = {
    description = "Ewellix lift ROS 2 driver";
  };
})
