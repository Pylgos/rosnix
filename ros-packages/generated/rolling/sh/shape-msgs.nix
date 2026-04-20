{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "shape_msgs";
  version = "5.9.2-1";
  src = finalAttrs.passthru.sources."shape_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "shape_msgs" = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "bc763574bfa61f7e3dab2e0020d8671f47f5a925";
        hash = "sha256-VmL6ZUQCnVaUs+vE5ZMMHTCRT9hVXAttDtMHQFaqDq4=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
})
