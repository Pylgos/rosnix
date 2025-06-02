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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_inventus_interfaces";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."canopen_inventus_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_inventus_interfaces" = substituteSource {
      src = fetchgit {
        name = "canopen_inventus_interfaces-source";
        url = "https://github.com/clearpath-gbp/canopen_inventus-release.git";
        rev = "4593346aa6496bf7a21761dda7fbd96c7861c1e1";
        hash = "sha256-5C8WvnhGcu3qC1P1YLiOWTuBVhEVLawSQYK07kpWiT8=";
      };
    };
  });
  meta = {
    description = "Inventus Battery ROS interfaces for CANOpen implementation";
  };
})
