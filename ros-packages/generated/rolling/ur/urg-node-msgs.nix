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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urg_node_msgs";
  version = "1.0.1-9";
  src = finalAttrs.passthru.sources."urg_node_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urg_node_msgs" = substituteSource {
      src = fetchgit {
        name = "urg_node_msgs-source";
        url = "https://github.com/ros2-gbp/urg_node_msgs-release.git";
        rev = "501c1fff317f6529662da46625b72f30de49d8b4";
        hash = "sha256-IBl7J8akPgn5ni5/8kPGDOh4Fklto+RggWCIxGald/w=";
      };
    };
  });
  meta = {
    description = "urg_node_msgs";
  };
})
