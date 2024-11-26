{
  ament-cmake,
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
  pname = "std_msgs";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "std_msgs" = substituteSource {
        src = fetchgit {
          name = "std_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "cf5ebefe7be1a9dd4369f6f7306bf56d975f883b";
          hash = "sha256-o9ZSUnDzgTJbNvOi3oMOyHRdOEdPwvitfmE99y+vxZ0=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some standard message definitions.";
  };
})
