{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_runtime";
  version = "1.8.1-2";
  src = finalAttrs.passthru.sources."rosidl_default_runtime";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "33168954cf2f8ec83f8f8d302a4bccb88457add2";
        hash = "sha256-QZqNprwydMZMElh/3T1XzV6KmD0CzeU2j3B0EP28Za4=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
})
