{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav_msgs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav_msgs" = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "10ec99e9770c392e7362947fdd997abdb9ded9f1";
        hash = "sha256-99u1PUOGdncERX6pY1WQLSqn6ou2O+N23qcYhQ9f3Nk=";
      };
    };
  });
  meta = {
    description = "A package containing some navigation related message and service definitions.";
  };
})
