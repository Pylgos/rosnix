{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "service_msgs";
  version = "2.0.2-2";
  src = finalAttrs.passthru.sources."service_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "service_msgs" = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "12ada02c781e18aef01dc69973206662fc87ab4b";
        hash = "sha256-SovP7aJEnj43eO5TW1SAqqteW/DQtfYWtr9rP9mJn/k=";
      };
    };
  });
  meta = {
    description = "Messages definitions common among all ROS services";
  };
})
