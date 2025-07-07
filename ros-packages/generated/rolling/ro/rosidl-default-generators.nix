{
  action-msgs,
  ament-cmake,
  ament-cmake-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_generators";
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."rosidl_default_generators";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs ament-cmake-core rosidl-core-generators service-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs ament-cmake-core rosidl-core-generators service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_generators" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "ed8827768aa860694a2078207665384735ed4018";
        hash = "sha256-ZF8f8ozBncIGawZWRuD1ZVHGym/RHcmpGubQdxjRdg4=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the default ROS interface generators.";
  };
})
