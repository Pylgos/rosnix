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
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."action_tutorials_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "action_tutorials_interfaces" = substituteSource {
        src = fetchgit {
          name = "action_tutorials_interfaces-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "3396948e639360943d85de860254c74bff6c6ebe";
          hash = "sha256-fezaouAp6goRibyozC/xz+9X+Do0jXtAkgauaw3VzfQ=";
        };
      };
    });
  };
  meta = {
    description = "Action tutorials action";
  };
})
