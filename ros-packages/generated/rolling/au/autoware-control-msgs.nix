{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "autoware_control_msgs";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."autoware_control_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_control_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_control_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "0817ed3ec465521ddf394c11042f391feaf8e06b";
        hash = "sha256-+FboAZxhqG6eYnZ81COkB6poYLwdeufZTOEhXvV7rtY=";
      };
    };
  });
  meta = {
    description = "Autoware control messages package.";
  };
})
