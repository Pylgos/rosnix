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
  pname = "eventdispatch_ros2_interfaces";
  version = "0.2.29-1";
  src = finalAttrs.passthru.sources."eventdispatch_ros2_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "eventdispatch_ros2_interfaces" = substituteSource {
      src = fetchgit {
        name = "eventdispatch_ros2_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_eventdispatch-release.git";
        rev = "54ca965b7aa4d382e18fe70df34c53e54afe5b63";
        hash = "sha256-Frr1gS8Is69ofwFebezMucx+Gm4fXR6MOAu59wkr27o=";
      };
    };
  });
  meta = {
    description = "ROSEvent srv / msg";
  };
})
