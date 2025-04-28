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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rosidl_default_generators";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-core-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rosidl-core-generators ];
  depsTargetTargetPropagated = [ action-msgs service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_generators" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "44b2c976f340d84b753f1f0ac0c9af94a64b1a90";
        hash = "sha256-UXsn8n6oeTuCfz/ZxZOi+TH+pXhwjNSpBW/MlOA0P/o=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the default ROS interface generators.";
  };
})
