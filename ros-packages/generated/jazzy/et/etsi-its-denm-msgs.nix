{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_denm_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "40b693b1ba71734432999a7a17e4fc68464a8b95";
        hash = "sha256-KNSdyyilxrazXlOydetGbvYhQ9K5tLAGa6x1EA8P/R0=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM";
  };
})
