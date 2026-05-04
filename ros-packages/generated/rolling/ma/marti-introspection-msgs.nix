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
  version = "1.6.1-2";
  src = finalAttrs.passthru.sources."marti_introspection_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_introspection_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_introspection_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "d0104f36cbaf740bb353347283cd7365a0d02e7f";
        hash = "sha256-4kJB+fMKvdSRrPrfPYQWhTqKrWVfqg2QFGLDDDiVjGs=";
      };
    };
  });
  meta = {
    description = "\n     marti_introspection_msgs\n  ";
  };
})
