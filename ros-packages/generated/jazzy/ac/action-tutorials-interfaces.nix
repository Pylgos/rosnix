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
  pname = "action_tutorials_interfaces";
  version = "0.33.8-1";
  src = finalAttrs.passthru.sources."action_tutorials_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "action_tutorials_interfaces" = substituteSource {
      src = fetchgit {
        name = "action_tutorials_interfaces-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "cd3dae378bc7c382e937ed81c5c864bf531b2cad";
        hash = "sha256-9NJEghToUkS3INb7+vDvP9k9zEO0FmHVij1oXoSoRZs=";
      };
    };
  });
  meta = {
    description = "Action tutorials action";
  };
})
