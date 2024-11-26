{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marti_introspection_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_introspection_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "marti_introspection_msgs" = substituteSource {
        src = fetchgit {
          name = "marti_introspection_msgs-source";
          url = "https://github.com/ros2-gbp/marti_messages-release.git";
          rev = "f90e8526d34aab64ae1e832bddea4cf2fe2e6cd3";
          hash = "sha256-4kJB+fMKvdSRrPrfPYQWhTqKrWVfqg2QFGLDDDiVjGs=";
        };
      };
    });
  };
  meta = {
    description = "marti_introspection_msgs";
  };
})
